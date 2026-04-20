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
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "tailwind.config.mjs",
    "postcss.config.js",
    "package.json",
    ".git",
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
          "tw`([^`]*)",
          'tw="([^"]*)',
          'tw={"([^"}]*)',
        },
      },
    },
  },
}
