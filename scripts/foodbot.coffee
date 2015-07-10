
module.exports = (robot) ->
	
	goodLunch = robot.brain.get('goodLunch') or ['Torchies','Barnabys','BB\'s','Shepherd Park']

	robot.respond /lunch?/i, (res) ->
		recommendLunch = res.random goodLunch
		res.reply "How about #{recommendLunch}? "
		#res.reply "Can I come? I know a good place."
		
	robot.respond /remember (.*)/i, (res) ->
		newLunch = res.match[1]
		goodLunch.push newLunch
		res.reply "I'll remember #{newLunch} for the future"
		robot.brain.set 'goodLunch', goodLunch
		
	robot.respond /what do you know?/i, (res) ->
		res.reply "I know about #{goodLunch}"