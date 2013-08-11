// modules
require("new-tabs.js");
require("session.js");
require("favicon");

// preferences
download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND; //download in background buffer
session_pref('browser.history_expire_days', 7); //history expire 7 days
url_completion_use_history = true;  //Show history in url completion
read_buffer_show_icons = true; //show favicons in the minibuffer completions list

// default directory for downloads and sell commands.
cwd = get_home_directory();
cwd.append("Downloads")

// History-url
define_browser_object_class(
    "history-url", null, 
    function (I, prompt) {
        check_buffer (I.buffer, content_buffer);
        var result = yield I.buffer.window.minibuffer.read_url(
            $prompt = prompt,  $use_webjumps = false, $use_history = true, $use_bookmarks = false);
        yield co_return (result);
    });

interactive("find-url-from-history",
            "Find a page from history in the current buffer",
            "find-url",
            $browser_object = browser_object_history_url);

interactive("find-url-from-history-new-buffer",
            "Find a page from history in the current buffer",
            "find-url-new-buffer",
            $browser_object = browser_object_history_url);

define_key(content_buffer_normal_keymap, "h", "find-url-from-history-new-buffer");
define_key(content_buffer_normal_keymap, "H", "find-url-from-history");

//mod line hooks
remove_hook("mode_line_hook", mode_line_adder(clock_widget)); //disalbe the clock
add_hook("mode_line_hook", mode_line_adder(buffer_count_widget), true); //shows how many buffers are open and which one is currently selected.
add_hook("mode_line_hook", mode_line_adder(loading_count_widget), true); //shows how many buffers are loading.
remove_hook("mode_line_hook", mode_line_adder(current_buffer_scroll_position_widget)); //removes the scroll position (#,#)
add_hook("mode_line_hook", mode_line_adder(downloads_status_widget)); //show the active download count.
add_hook("mode_line_hook", mode_line_adder(buffer_icon_widget), true); //enable favicons in the mode-line

function darken_page (I) {
    var styles='* { background: #242424 !important; color: #474747 !important; }'+
        ':link, :link * { color: #17B2FF !important; }'+
        ':visited, :visited * { color: #965d98 !important; }';
    var document = I.buffer.document;
    var newSS=document.createElement('link');
    newSS.rel='stylesheet';
    newSS.href='data:text/css,'+escape(styles);
    document.getElementsByTagName("head")[0].appendChild(newSS);
}

interactive("darken-page", "Darken the page in an attempt to save your eyes.",
            darken_page);

define_key(content_buffer_normal_keymap, "C-d", "darken-page");
