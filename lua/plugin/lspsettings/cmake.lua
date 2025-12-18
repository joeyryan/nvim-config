return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern("CMakeLists.txt", ".git")(fname)
  end,
  init_options = {
    buildDirectory = "build", -- The build directory relative to the project root
  },
  settings = {
    cmake = {
      filetypes = { "cmake" },
      buildDirectory = "build", -- Automatically use `build/` folder for configuration
      format = {
        enable = true, -- Enables cmake-format integration
      },
      diagnostics = {
        enable = true, -- Enable basic CMake diagnostics
      },
    },
  },
}
