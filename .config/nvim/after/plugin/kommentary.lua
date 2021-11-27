local status, kommentary = pcall(require, 'kommentary.config')
if (not status) then return end

kommentary.configure_language("default", {
    use_consistent_indentation = true,
    ignore_whitespace = true,
})

kommentary.configure_language("rust", {
    single_line_comment_string = "//",
    multi_line_comment_strings = {"/*", "*/"},
})
