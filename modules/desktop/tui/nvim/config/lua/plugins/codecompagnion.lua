return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      adapters = {
        my_openai = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://ollama.sagbot.com",
            },
            schema = {
              model = {
                default = "codellama:7b",
              },
            },
          })
        end
      },
      strategies = {
        chat = {
          adapter = "my_openai",
        },
        inline = {
          adapter = "my_openai",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
