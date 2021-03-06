function Update()       
	tShamsiDate = ShamsiDateCalculator()	
	SKIN:Bang('!SetOption', 'ShamsiMonth', 'Text', (tShamsiDate[1]))
	SKIN:Bang('!SetOption', 'ShamsiDay', 'Text', (tShamsiDate[0]))
	SKIN:Bang('!SetOption', 'ShamsiYear', 'Text', (tShamsiDate[2]))
	return 'dates refreshed....'
end -- of function Update	

function ShamsiDateCalculator ()
	secondInOneDay = 86400
	difference = 57600
	timeStamp = os.time(os.date("!*t")) - difference
	days = math.floor(timeStamp / secondInOneDay)+1
	year = 1348
	month = 11
	day = 11
	days = days - 20
	daysInMonth = {31,31,31,31,31,31,30,30,30,30,30,29}
	while true do
		if ( days > daysInMonth[month-1]) then
			days = days - daysInMonth[month-1]
			month = month + 1
			if (month == 14) then
				year = year + 1
				if ((year - 1347)%4 == 0) then
					days = days - 1
				end
				month = 2
			end
		else
			break
		end
	end

	monthTitles = {
	"فروردین",
	"اردیبهشت",
	"خرداد",
	"تیر",
	"مرداد",
	"شهریور",
	"مهر",
	"آبان",
	"آذر",
	"دی",
	"بهمن",
	"اسفند",
	}
	
	myRes = {}
	myRes[0] = days
	myRes[1] = monthTitles[month]
	myRes[2] = year
	return myRes
end  -- of ShamsiDateCalculator

