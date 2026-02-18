IO.puts("Global config starting")
IEx.configure(
  colors: [eval_result: [:cyan, :bright]],
  default_prompt: "%prefix(%counter) >"
)
