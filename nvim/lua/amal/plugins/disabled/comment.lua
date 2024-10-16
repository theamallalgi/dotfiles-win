return {
	'numToStr/Comment.nvim',
	lazyload=true,
	event = {"BufReadPre", "BufNewFile"},
	config = true -- runs require('comment').setup()
}
