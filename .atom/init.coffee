path = require 'path'

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()
  if path.basename(editor.getPath()) is 'Makefile'
    editor.setSoftTabs(false)

atom.workspaceView.eachEditorView (editorView) ->
  editor = editorView.getEditor()
  if path.extname(editor.getPath()) is '.md'
    editor.setSoftWrap(true)
