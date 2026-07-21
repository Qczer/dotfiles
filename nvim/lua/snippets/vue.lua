local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('vue', {
  s('props', {
    t { 'const props = defineProps<{', '' },
    i(1),
    t { '', '}>' },
  }),

  s('setup', {
    t { '<script setup lang="ts">', '' },
    i(1),
    t { '', '</script>' },
  }),

  s('templ', {
    t { '<template>', '' },
    i(1),
    t { '', '</template>' },
  }),
})
