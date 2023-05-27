local M = {}

M.adapter = {
    type = "executable",
    -- flutter:
    command = "fvm",
    args = { "flutter", "debug_adapter" }
    -- dart:
    -- command = "dart",
    -- args = { "debug_adapter" }
}

M.configuration = {
    {
        type = "dart",
        request = "launch",
        name = "Launch Dart/Flutter Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
        args = {}, -- dart
        toolArgs = {"-d", "emulator-5554"} -- flutter
    }
}

return M
