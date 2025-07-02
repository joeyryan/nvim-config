return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      -- Note: This assumes clippy is installed via rustup component add clippy.
      -- If not, either install it or change checkOnSave.command to "check".
      checkOnSave = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
