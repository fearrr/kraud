CKEDITOR.plugins.add('newplugin',
    {
        init: function (editor) {
            var pluginName = 'newplugin';
            editor.ui.addButton('Newplugin',
                {
                    label: 'My New Plugin',
                    command: 'OpenWindow',
                    icon: CKEDITOR.plugins.getPath('newplugin') + 'mybuttonicon.gif'
                });
            var cmd = editor.addCommand('OpenWindow', { exec: showMyDialog });
        }
    });
function showMyDialog(e) {
    window.open('/Default.aspx', 'MyWindow', 'width=800,height=700,scrollbars=no,scrolling=no,location=no,toolbar=no');
}