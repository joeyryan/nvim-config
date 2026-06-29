return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = {
          enable = true,
        },
      },
      check = {
        command = "clippy",
        allTargets = true,
      },
      -- Note: This assumes clippy is installed via rustup component add clippy.
      -- If not, either install it or change check.command to "check".
      checkOnSave = true,
      completion = {
        autoimport = {
          enable = true,
        },
        callable = {
          snippets = "fill_arguments",
        },
        postfix = {
          enable = true,
        },
      },
      diagnostics = {
        enable = true,
        disabled = { "unlinked-file" },
        experimental = {
          enable = true,
        },
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      inlayHints = {
        bindingModeHints = {
          enable = true,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 20,
        },
        closureReturnTypeHints = {
          enable = "with_block",
        },
        discriminantHints = {
          enable = "fieldless",
        },
        lifetimeElisionHints = {
          enable = "skip_trivial",
          useParameterNames = true,
        },
        parameterHints = {
          enable = true,
        },
        typeHints = {
          enable = true,
        },
      },
      lens = {
        debug = {
          enable = true,
        },
        enable = true,
        implementations = {
          enable = true,
        },
        references = {
          adt = {
            enable = true,
          },
          enumVariant = {
            enable = true,
          },
          method = {
            enable = true,
          },
          trait = {
            enable = true,
          },
        },
        run = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
