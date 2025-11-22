const vscode = require('vscode');

/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
    console.log('Admin Python Self Highlight extension is now active!');

    // Create decoration type for highlighting 'self' parameter
    let highlightDecorationType;

    // Function to update decorations
    function updateDecorations() {
        const editor = vscode.window.activeTextEditor;
        if (!editor) {
            return;
        }

        const document = editor.document;
        if (document.languageId !== 'python') {
            return;
        }

        const config = vscode.workspace.getConfiguration('adminPythonSelfHighlight');
        if (!config.get('enabled', true)) {
            return;
        }

        // Update decoration type with current config
        if (highlightDecorationType) {
            highlightDecorationType.dispose();
        }
        const highlightColor = config.get('highlightColor', '#ff00ff');
        const backgroundColor = config.get('backgroundColor', 'transparent');
        highlightDecorationType = vscode.window.createTextEditorDecorationType({
            color: highlightColor, // 文字颜色
            fontWeight: 'bold',
            backgroundColor: backgroundColor, // 背景颜色
            borderRadius: backgroundColor !== 'transparent' ? '2px' : undefined,
            light: {
                color: highlightColor,
                backgroundColor: backgroundColor
            },
            dark: {
                color: highlightColor,
                backgroundColor: backgroundColor
            }
        });

        const text = document.getText();
        const lines = text.split('\n');
        const decorations = [];

        for (let i = 0; i < lines.length; i++) {
            const originalLine = lines[i];
            const line = originalLine.trim();
            
            // Check if line starts with 'def' (method definition)
            if (line.startsWith('def ')) {
                // Extract method signature
                const match = line.match(/def\s+(\w+)\s*\(([^)]*)\)/);
                if (match) {
                    const methodName = match[1];
                    const parameters = match[2].trim();
                    
                    // Check if it's not a static method and first parameter is 'self'
                    if (!line.includes('@staticmethod') && parameters.startsWith('self')) {
                        // Find 'self' in the original line with proper indentation
                        const selfMatch = originalLine.match(/\(\s*self/);
                        if (selfMatch) {
                            // Get the exact position of 'self' in the original line
                            const matchText = selfMatch[0];
                            const matchStart = selfMatch.index;
                            const selfStartInMatch = matchText.indexOf('self');
                            const selfStartIndex = matchStart + selfStartInMatch;
                            const selfEndIndex = selfStartIndex + 4; // 'self' length is 4
                            
                            const startPos = new vscode.Position(i, selfStartIndex);
                            const endPos = new vscode.Position(i, selfEndIndex);
                            
                            decorations.push({
                                range: new vscode.Range(startPos, endPos),
                                hoverMessage: `First parameter 'self' in method '${methodName}'`
                            });
                        }
                    }
                }
            }
        }

        editor.setDecorations(highlightDecorationType, decorations);
    }

    // Register event listeners
    const activeEditorChange = vscode.window.onDidChangeActiveTextEditor(updateDecorations);
    const documentChange = vscode.workspace.onDidChangeTextDocument(updateDecorations);
    const configChange = vscode.workspace.onDidChangeConfiguration(event => {
        if (event.affectsConfiguration('adminPythonSelfHighlight')) {
            updateDecorations();
        }
    });

    // Initial update
    updateDecorations();

    // Register disposables
    context.subscriptions.push(
        highlightDecorationType,
        activeEditorChange,
        documentChange,
        configChange
    );
}

function deactivate() {};

module.exports = {
    activate,
    deactivate
};