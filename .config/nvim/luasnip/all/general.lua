local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local calculate_comment_string = require('Comment.ft').calculate
local utils = require('Comment.utils')

--- Get the comment string {beg,end} table
---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
---@return table comment_strings {begcstring, endcstring}
local get_cstring = function(ctype)
  local cstring = calculate_comment_string { ctype = ctype, range = utils.get_region() } or vim.bo.commentstring
  local left, right = utils.unwrap_cstr(cstring)
  return { left, right }
end

--- Returns snippet that is wrapped inside comment
---@param ctype number 1 = line comment, 2 = block comment
---@param before string text to insert before insert spot
---@param after string text to insert after insert spot
---@return table # snippet
local function get_comment_snippet(ctype, before, after)
    return {
    f(function()
      return get_cstring(ctype)[1] -- get <comment-string[1]>
    end),
    t(before),
    i(1), -- {comment-text}
    t(after),
    f(function()
      return get_cstring(ctype)[2] -- get <comment-string[2]>
    end),
  }
end

local date_options = {
    -- Pure date
    fmt("{}", i(1, os.date("%d.%m.%Y"))),
    -- Weekday + date
    fmt("{}", i(1, os.date("%a %d.%m.%Y"))),
    -- week + date
    fmt("Viikko {}", { i(1, os.date("%W, %d.%m.%Y")) }),
    -- Date + clock
    fmt("{}", i(1, os.date("%d.%m.%Y %H:%M:%S"))),
    -- Day + month
    fmt("{}", i(1, os.date("%d.%m"))),
}

local time_options = {
    fmt("{}", i(1, os.date("%H:%M"))),
    fmt("{}", i(1, os.date("%H:%M:%S"))),
}

return {
    s("header", get_comment_snippet(1, " ***** ", " *****")),
    -- s("braces", { t("{"), i(0), t("}") }),
    -- s("brackets", { t("["), i(0), t("]") }),
    -- s("at", { t("@") }),
    -- s("percent", { t("%") }),
    -- s("and", { t("&") }),
    -- s("dollar", { t("$") }),
    -- s("ssharp", { t("ß") }),
	s("tänään", { c(1, date_options) }),
    s("klo", { c(1, time_options) }),
}
