local status_ok, project_config = pcall(require, "nvim-projectconfig")
if not status_ok then
  return
end
project_config.setup({});
