return {
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  root_markers = { "CMakeLists.txt", "CMakePresets.json", ".git" },
  init_options = {
    buildDirectory = "build",
  },
  settings = {
    cmake = {
      filetypes = { "cmake" },
      buildDirectory = "build",
      format = { enable = true },
      diagnostics = { enable = true },
    },
  },
}
