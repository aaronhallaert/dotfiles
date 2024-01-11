local M = {}
local cmake = require("cmake-tools")
local icons = require("aaron.icons")
local color = { fg = "#cad3f5" }

M.configure_preset = {
    function()
        local c_preset = cmake.get_configure_preset()
        return "CMake: [" .. (c_preset and c_preset or "X") .. "]"
    end,
    color = color,
    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectConfigurePreset")
            end
        end
    end,
}

M.build_type = {
    function()
        local type = cmake.get_build_type()
        return "CMake: [" .. (type and type or "") .. "]"
    end,
    color = color,

    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectBuildType")
            end
        end
    end,
}

M.build_kit = {
    function()
        local kit = cmake.get_kit()
        return "[" .. (kit and kit or "X") .. "]"
    end,
    color = color,
    icon = icons.ui.Pencil,
    cond = function()
        return cmake.is_cmake_project() and not cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectKit")
            end
        end
    end,
}

M.build = {
    function()
        return "Build"
    end,
    color = color,
    icon = icons.ui.Gear,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeBuild")
            end
        end
    end,
}

M.build_preset = {
    function()
        local b_preset = cmake.get_build_preset()
        return "[" .. (b_preset and b_preset or "X") .. "]"
    end,
    color = color,
    icon = icons.ui.Search,
    cond = function()
        return cmake.is_cmake_project() and cmake.has_cmake_preset()
    end,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectBuildPreset")
            end
        end
    end,
}

M.build_target = {
    function()
        local b_target = cmake.get_build_target()
        return "[" .. (b_target and b_target or "X") .. "]"
    end,
    color = color,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectBuildTarget")
            end
        end
    end,
}

M.debug = {
    function()
        return icons.ui.Debug
    end,
    color = color,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeDebug")
            end
        end
    end,
}

M.run = {
    function()
        return icons.ui.Run
    end,
    color = color,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeRun")
            end
        end
    end,
}

M.launch_target = {
    function()
        local l_target = cmake.get_launch_target()
        return "[" .. (l_target and l_target or "X") .. "]"
    end,
    color = color,
    cond = cmake.is_cmake_project,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectLaunchTarget")
            end
        end
    end,
}

local function get_last_part_of_path(str)
    local parts = {}

    -- Split the string by "/"
    for part in string.gmatch(str, "[^/]+") do
        table.insert(parts, part)
    end

    -- Retrieve the last value
    local lastValue = parts[#parts]

    return lastValue
end

M.build_dir = {
    function()
        local l_target =
            get_last_part_of_path(cmake.get_build_directory().filename)

        return "[" .. (l_target and l_target or "X") .. "]"
    end,
    color = color,
    cond = cmake.is_cmake_project,
    icon = icons.kind.Folder,
    on_click = function(n, mouse)
        if n == 1 then
            if mouse == "l" then
                vim.cmd("CMakeSelectBuildDir")
            end
        end
    end,
}

return M
