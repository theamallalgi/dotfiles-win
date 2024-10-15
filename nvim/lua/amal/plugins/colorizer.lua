return {
	"norcalli/nvim-colorizer.lua",
	lazyload=true,
	config = function()
		require('colorizer').setup({
			'*'
		})
	end
}
