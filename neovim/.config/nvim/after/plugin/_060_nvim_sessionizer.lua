-- local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local goto_session = function(root)
    local found_existing = false
    for _, tab_id in ipairs(vim.api.nvim_list_tabpages()) do
        local status, tab_root_dir = pcall(
            vim.api.nvim_tabpage_get_var, tab_id, "nvim_sessionizer__root"
        )
        if not status then
            goto continue
        end

        if tab_root_dir == root then
            vim.api.nvim_set_current_tabpage(tab_id)
            found_existing = true
            break
        end
        ::continue::
    end

    if not found_existing then
        vim.cmd.tabnew()
        vim.cmd("tcd " .. root)
        vim.api.nvim_tabpage_set_var(0, "nvim_sessionizer__root", root)

        -- initialize the new window
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
        vim.cmd("terminal")
        vim.defer_fn(function()
            vim.cmd("startinsert!")
        end, 100)
    end
end

local session_picker = function(opts)
    opts = opts or {}

    local home = vim.fn.expand('~')
    local dirs = {
        home .. '/vimwiki',
        home .. '/dotfiles',
    }

    local projects_root = home .. '/projects'
    local project_entries = vim.fn.glob(projects_root .. '/*', true, true) or {}

    for _, path in ipairs(project_entries) do
        if vim.fn.isdirectory(path) == 1 then
            table.insert(dirs, path)
        end
    end

    pickers.new(opts, {
        prompt_title = 'Select session',
        finder = finders.new_table({
            results = dirs
        }),
        sorter = sorters.get_generic_fuzzy_sorter(opts),
        attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local root = action_state.get_selected_entry()[1]
                goto_session(root)
            end)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "<C-b>", session_picker)
