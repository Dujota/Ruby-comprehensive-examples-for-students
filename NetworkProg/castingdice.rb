require "net/http"

URL = "https://www.random.org/integers/"

def get_random_numbers(count=1, min=0, max=99)
	uri = URI.parse(URL)
	uri.query = URI.encode_www_form(
		col: 1, base: 10, format: "plain", rnd: "new",
		num: count, min: min, max: max 
		)
	response = Net::HTTP.get_response(uri)
	puts response.inspect
	case response
	when Net::HTTPOK
    puts response.body
		response.body.lines.map(&:to_i)
	else
		[]
	end
end

DICE_LINES = [
  "+-----+ +-----+ +-----+ +-----+ +-----+ +-----+ ",
  "|     | |  *  | |*    | | * * | | * * | | * * | ",
  "|  *  | |     | |  *  | |     | |  *  | | * * | ",
  "|     | |  *  | |    *| | * * | | * * | | * * | ",
  "+-----+ +-----+ +-----+ +-----+ +-----+ +-----+ "
]

DIE_WIDTH = DICE_LINES[0].length/6

def draw_dice(values)
	DICE_LINES.each do |line| 
		for v in values
			print line[(v - 1) * DIE_WIDTH, DIE_WIDTH]
			print " "
		end
		puts
	end
end

draw_dice(get_random_numbers(5, 1, 6))

