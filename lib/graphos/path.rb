
require "algorithms"
module Graphos
	module Algorithm
		include Containers
		class Path
			#um path é uma lista de nós e um custo
			def initialize node, weight
				#não sei pensar em OOzês
				@cost = weight
				@path = [node]
			end

			def addNode node, weight
				@path += [node]
				@cost += weight
			end

			def +(paf)
				result = dup
				result.@cost += paf.@cost
				result.@path.concat(paf.@path)
				return result
			end
		end
	end
end