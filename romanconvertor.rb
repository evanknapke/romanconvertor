def fromRoman(romanNumber)
    arabicNumber = 0
    skipLoop = false
    listOfRomans = romanNumber.split('')
    listOfRomans.each_with_index { |num, i|
        if skipLoop
            skipLoop = false
            next
        end

        if num == 'M'
            arabicNumber += 1000

        elsif num == 'D'
            arabicNumber += 500

        elsif num == 'C'
            if listOfRomans[i+1] == 'M'
                arabicNumber += 900
                skipLoop = true
            elsif listOfRomans[i+1] == 'D'
                arabicNumber += 400
                skipLoop = true
            else
                arabicNumber += 100
            end

        elsif num == 'L'
            arabicNumber += 50

        elsif num == 'X'
            if listOfRomans[i+1] == 'C'
                arabicNumber += 90
                skipLoop = true
            elsif listOfRomans[i+1] == 'L'
                arabicNumber += 40
                skipLoop = true
            else
                arabicNumber += 10
            end

        elsif num == 'V'
            arabicNumber += 5

        elsif num == 'I'
            if listOfRomans[i+1] == 'X'
                arabicNumber += 9
                skipLoop = true
            elsif listOfRomans[i+1] == 'V'
                arabicNumber += 4
                skipLoop = true
            else
                arabicNumber += 1
            end

        else
            raise TypeError
        end
    }
    return arabicNumber
end

def toRoman(arabicNumber)
    romanNumber = ''
    if arabicNumber > 0 && arabicNumber <= 3999
        while arabicNumber > 0
            if arabicNumber >= 1000
                romanNumber += 'M'
                arabicNumber -= 1000

            elsif arabicNumber >= 900
                romanNumber += 'CM'
                arabicNumber -= 900

            elsif arabicNumber >= 500
                romanNumber += 'D'
                arabicNumber -= 500

            elsif arabicNumber >= 400
                romanNumber += 'CD'
                arabicNumber -= 400

            elsif arabicNumber >= 100
                romanNumber += 'C'
                arabicNumber -= 100

            elsif arabicNumber >= 90
                romanNumber += 'XC'
                arabicNumber -= 90

            elsif arabicNumber >= 50
                romanNumber += 'L'
                arabicNumber -= 50

            elsif arabicNumber >= 40
                romanNumber += 'XL'
                arabicNumber -= 40

            elsif arabicNumber >= 10
                romanNumber += 'X'
                arabicNumber -= 10

            elsif arabicNumber >= 9
                romanNumber += 'IX'
                arabicNumber -= 9

            elsif arabicNumber >= 5
                romanNumber += 'V'
                arabicNumber -= 5

            elsif arabicNumber >= 4
                romanNumber += 'IV'
                arabicNumber -= 4

            elsif arabicNumber >= 1
                romanNumber += 'I'
                arabicNumber -= 1

            end
        end
        return romanNumber
    else
      raise RangeError
    end
end
