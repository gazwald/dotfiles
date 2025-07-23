require('avante').setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  ---@type Provider
  provider = "ollama", -- The provider used in Aider mode or in the planning phase of Cursor Planning Mode
  ---@alias Mode "agentic" | "legacy"
  ---@type Mode
  mode = "legacy", -- The default mode for interaction. "agentic" uses tools to automatically generate code, "legacy" uses the old planning method to generate code.
  -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
  -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
  -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
  auto_suggestions_provider = "ollama",
  providers = {
    ollama = {
      endpoint = "http://ai.poppet.io:11434",
      model = "mistral",
    },
  },
  behaviour = {
    auto_suggestions = true, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
    enable_token_counting = false, -- Whether to enable token counting. Default to true.
    auto_approve_tool_permissions = false, -- Default: show permission prompts for all tools
    -- Examples:
    -- auto_approve_tool_permissions = true,                -- Auto-approve all tools (no prompts)
    -- auto_approve_tool_permissions = {"bash", "replace_in_file"}, -- Auto-approve specific tools only
  },
  prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
    enabled = true, -- toggle logging entirely
    log_dir = vim.fn.stdpath("cache") .. "/avante_prompts", -- directory where logs are saved
    fortune_cookie_on_success = false, -- shows a random fortune after each logged prompt (requires `fortune` installed)
    next_prompt = {
      normal = "<C-n>", -- load the next (newer) prompt log in normal mode
      insert = "<C-n>",
    },
    prev_prompt = {
      normal = "<C-p>", -- load the previous (older) prompt log in normal mode
      insert = "<C-p>",
    },
  },
  rag_service = { -- RAG Service configuration
    enabled = false, -- Enables the RAG service
    host_mount = '/home/user/local/checkouts', -- Host mount path for the rag service (Docker will mount this path)
    runner = "docker", -- Runner for the RAG service (can use docker or nix)
    llm = { -- Language Model (LLM) configuration for RAG service
      provider = "ollama", -- LLM provider
      endpoint = "http://localhost:11434",
      api_key = "", -- Environment variable name for the LLM API key
      model = "qwen2.5-coder:7b", -- LLM model name
      extra = nil, -- Additional configuration options for LLM
    },
    embed = { -- Embedding model configuration for RAG service
      provider = "ollama", -- Embedding provider
      endpoint = "http://localhost:11434",
      api_key = "", -- Environment variable name for the embedding API key
      model = "nomic-embed-text:v1.5", -- Embedding model name
      extra = nil, -- Additional configuration options for the embedding model
    },
    docker_extra_args = "", -- Extra arguments to pass to the docker command
  },
})
