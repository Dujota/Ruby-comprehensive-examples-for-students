#!/usr/bin/ruby -w

##
#
# == Levenshein Distance Between Two String
#
# The Levenshein distance is the minimum number of modificatons needed
# to change one string into another, using three basic modification 
# operations: <tt> del(-etion)</tt>, <tt>ins(-ertion)</tt>, and 
# <tt>sub(-stitution)</tt>. A substitution is also considered to be a
# combination of a deletion and insertion (<tt>indel</tt>).
#
# Sample code:
#
#   s1 = "ACUGAUGUGA"
#   s2 = "AUGGAA"
#   s1.levenshtein(s2)         # 9
#

class String
  def levenshtein(other, ins=2, del=2, sub=1)
    # ins, del, sub are weighted costs
    return nil if self.nil?
    return nil if other.nil?
    dm = []				# distance matrix

    # Initialize first row values
    dm[0] = (0..self.length).collect {|i| i * ins }
    fill = [0] * (self.length - 1)

    # Initialize first column values
    for i in 1..other.length
    	dm[i] = [i * del, fill.flatten]
    end

    # populate matrix
    for i in 1..other.length
    	for j in 1..self.length
    		# critical comparison
    		dm[i][j] = [
    			dm[i-1][j-1] +
    		    (self[j-1] == other[i - 1] ? 0 : sub),
    		  		dm[i][j-1] + ins,
    		  dm[i-1][j] + del
    	  ].min 
    	end
    end

    # The last value in matrix is the
    # Levenshtein distance between the strings
    dm[other.length][self.length]
  end

  def similar?(other, thresh=2)
    self.levenshtein(other) < thresh
  end

end
