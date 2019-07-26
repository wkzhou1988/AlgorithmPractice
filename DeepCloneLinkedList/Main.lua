local node1, node2, node3, node4
node1 = {
    name = 'node1'
}
node2 = {
    name = 'node2'
}
node3 = {
    name = 'node3'
}
node4 = {
    name = 'node4'
}
node1.next = node2
node1.value = node3

node2.next = node3
node2.value = node1

node3.next = node4
node3.value = node2

node4.next = nil
node4.value = node4

local current

print("BEFORE")

current = node1
while current do
    print('node: ', current.name)
    if current.next then
        print('node.next: ', current.next.name)
    end
    print('node.value: ', current.value.name)
    current = current.next
end


local map = {}
current = node1

local function copy(old_node)
    if not old_node then
        return nil
    end
    local cp = map[old_node]
    if cp then
        return cp
    end
    cp = {}
    cp.name = old_node.name
    map[old_node] = cp
    cp.next = copy(old_node.next)
    if old_node.value == old_node then
        cp.value = cp
    else
        cp.value = copy(old_node.value)
    end

    return cp
end

print("BEGIN")

while current do
    copy(current)
    current = current.next
end


-- test
print("AFTER")

current = map[node1]
while current do
    print('node: ', current.name)
    if current.next then
        print('node.next: ', current.next.name)
    end
    print('node.value: ', current.value.name)
    current = current.next
end
