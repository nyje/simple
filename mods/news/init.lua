 
local news = {}

news.path = minetest.get_worldpath()

function news.formspec(player,article)
	
	if ( article == "" or article == nil ) then
		article = "news.txt"
	else
		article = "news_"..article..".txt"
	end
	
	local newsfile = io.open(news.path.."/"..article,"r")
	
	local formspec = "size[12,10;]"
	
	if newsfile ~= nil then
		local newscontent = newsfile:read("*a")
		formspec = formspec.."textarea[.5,.5;11,9;news;;"..minetest.formspec_escape(newscontent).."]"
	else		
		formspec = formspec.."label[.5,.5;Article does not exist]"
	end		
	formspec = formspec.."button_exit[.25,9;2,1;exit;Close"
	if ( newsfile ~= nil ) then
		newsfile:close()
	end
	return formspec
end

function news.show_formspec(player)
	local name = player:get_player_name()
	minetest.show_formspec(name,"news",news.formspec(player))
	minetest.log('action','Showing formspec to '..name)
end


minetest.register_chatcommand("news",{
	params = "<article>",
	description="Shows the server news",
	func = function (name,params)
		local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name,"news",news.formspec(player,params))	
	end,
})

minetest.register_on_joinplayer(function (player)
	minetest.after(5,news.show_formspec,player)
end)

