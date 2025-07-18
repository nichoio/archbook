-- Define Plenary as explicit dependency to enforce that the lastest commit from their master branch is used.
-- Plenary doesn't maintain up to date tags currently (2025).
return {
    'nvim-lua/plenary.nvim',
    branch = 'master'
}
