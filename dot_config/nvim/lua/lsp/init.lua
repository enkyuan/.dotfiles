local capabilities = require("lsp.handlers").capabilities

local lspconfig = require("lspconfig") 
if _lspconfig then

	-- Python
	lspconfig.pyright.setup({
		autostart = false,
		capabilities = capabilities,
	})

	-- LUA
	lspconfig.lua_ls.setup({
		autostart = false,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})

	-- Clangd (C++)
	lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = { 
            "clangd", 
            "--offset-encoding=utf-16" 
        },
    })

	-- Bash
	lspconfig.bashls.setup({
		autostart = false,
	})

	-- Javascript/Typescript
	lspconfig.eslint.setup({
		autostart = true,
		capabilities = capabilities,
		settings = {
			packageManager = "npm",
		},
		on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end,
	})

    -- VUE
    lspconfig.ts_ls.setup {
        init_options = {
            plugins = {
                {
                    name = '@vue/typescript-plugin',
                    location = 'usr/local/lib/node_modules/@vue/language-server',
                    languages = { 'vue' },
                },
            },
        },
    }

    -- No need to set `hybridMode` to `true` as it's the default value
    lspconfig.volar.setup {
        init_options = {
            vue = {
                hybridMode = false,
            }
        }
    }

	-- HTML
	lspconfig.html.setup({
		autostart = false,
		capabilities = capabilities,
	})

	-- CSS
	lspconfig.cssls.setup({
		autostart = false,
		capabilities = capabilities,
	})

    -- Ruby
    lspconfig.ruby_lsp.setup({
        init_options = {
            formatter = 'standard',
            linters = { 'standard' },
        },
    })


	-- Dockerfile
	lspconfig.dockerls.setup({
		autostart = false,
		capabilities = capabilities,
	})

	-- Docker compose
	lspconfig.docker_compose_language_service.setup({
		autostart = false,
		capabilities = capabilities,
	})

	-- XML
	lspconfig.lemminx.setup({})

	-- VUE
	lspconfig.vuels.setup({})
end
