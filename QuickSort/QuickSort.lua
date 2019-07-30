local function quick_sort(input, left, right)
    if left >= right then
        return
    end
    print('input ', table.concat(input, ','))
    print('sort', left, right)
    local pivot = input[left]
    print('pivot', pivot)
    local i = left
    local j = right
    while i < j do
        -- i <= j is for that i - 1 is always the last one smaller or equal than pivot
        while i <= j and input[i] <= pivot do
            i = i + 1
        end
        -- j is not very important here
        while i < j and input[j] >= pivot do
            j = j - 1
        end
        if i < j then
            print('swap ', input[i], input[j])
            input[i], input[j] = input[j], input[i]
        end
    end
    -- always use i - 1 as the new pivot index
    local new_pivot_pos = i - 1
    local new_pivot = input[new_pivot_pos]
    input[new_pivot_pos] = pivot
    input[left] = new_pivot
    print('after sort ', table.concat(input, ','))
    quick_sort(input, left, new_pivot_pos - 1)
    quick_sort(input, new_pivot_pos + 1, right)
end

local input = {5,6,2,7,8,4,9,3,1,10}
quick_sort(input, 1, 10)
print(table.concat(input, ','))
