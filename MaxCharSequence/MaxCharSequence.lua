local function GetCharSequenceLengthFromIndex(input, startIndex)
    print('begin at index', startIndex)
    local lettersSaw = {}
    local length = string.len(input)
    local counter = 0
    for i = startIndex, length do
        local char = string.sub(input, i, i)
        if lettersSaw[char] then
            return counter
        end
        print(char)
        lettersSaw[char] = true
        counter = counter + 1
    end
    return counter
end

local function Main(input)
    local length = string.len(input)
    if length <= 1 then
        return length
    end

    local lengthResult = 0
    local finalResult = 0
    for i=1, length do
        lengthResult = GetCharSequenceLengthFromIndex(input, i)
        finalResult = math.max(finalResult, lengthResult)
    end
    return finalResult
end

local testcase = "aabbabccdabcefgde"
print('final result is: ', Main(testcase))