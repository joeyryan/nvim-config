return {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "astro",
    "svelte",
  },
  init_options = {
    userLanguages = {
      eelixir = "html",
      eruby = "html",
    },
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidScreen = "error",
        invalidVariant = "error",
        invalidConfigPath = "error",
      },
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          'tw="([^"]*)', -- tw="..."
          'tw={"([^"}]*)', -- tw={"..."}
        },
      },
    },
  },
  root_dir = require("lspconfig.util").root_pattern(
    "tailwind.config.js",
    "tailwind.config.ts",
    "postcss.config.js",
    "package.json",
    ".git"
  ),
}
