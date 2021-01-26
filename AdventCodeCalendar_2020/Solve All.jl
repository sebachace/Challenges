

URL = raw"/adventofcode.com/2020/day/1/input"
path = raw"C:\Users\c-ba7\Downloads\input.txt"
using CSV, DataFrames, HTTP

# Common information

input_path = raw"C:\Users\c-ba7\Documents\Github\Challenges\AdventCodeCalendar_2020\Inputs\\"

# Day 1 puzzle solution

data = CSV.File(HTTP.get(URL).body )
data = CSV.File(path, header = false,delim= raw"\n")
df = CSV.File(path, header = false,delim= raw"\n") |> DataFrame
sort!(df, :Column1)
list = convert(Array, df)
function find200(input)
    tot = Int(ceil(length(input) / 2))

    for item1 in input
        for item2 in input
            for item3 in input
                if item1 + item2 + item3 == 2020
                    # println("Es $item1 y $item2")
                    return(item1*item2*item3)
                end
            end

        end
    end
    return("Fail")
end
find200(list)


# Day 2 Puzzle solution

path = input_path*"input_day2.txt"

function checkPolicy(min::Int64, max::Int64, pass, token)
    println("tipos: $(typeof(min)) $(typeof(max)) $(typeof(pass)) $(typeof(token))")
    if (count(token, pass) < min) || (count(token, pass) > max)
        println(pass)
        return(0)
    end
    return(1)
end

function checkPolicy2(min::Int64, max::Int64, pass, token)
    print("Tipo de pass: $(typeof(pass[min])) y tipo de token: $(typeof(token[1]))")
    try
        if pass[min] == token[1] && pass[max] != token[1]
            print(" Valid 1")
            return(1)
        end
        print("Trate con $(pass[min]) y $token, son diferentes 1")
    catch
        print("\t not valid 1")
        return(0)
    end

    try
        if pass[max] == token[1] && pass[min] != token[1]
            print(" Valid 2")
            return(1)
        end
        print("Trate con $(pass[min]) y $token, son diferentes 2")
    catch
        print("\t not valid 2")
        return(0)
    end
    print("\t not valid 3")
    return(0)
end

# open(path) do r
compliance = 0
for line in eachline(path)
    prow = line
    prow = replace(prow, ":" => "")
    prow = split(prow, " ")
    indices = split(prow[1], "-")
    min = parse(Int,indices[1])
    max = parse(Int, indices[2])
    letter = prow[2]
    pass = prow[3]
    println("\n $min $max $pass $letter ----------------")
    compliance+=checkPolicy2(min, max, pass, letter)
end
print(compliance)
# end
quick(bing) == "1"


# Day 3 Puzzle Solution

using DelimitedFiles
using CSV, DataFrames


path = input_path*"input_day3.txt"

terrain = readdlm(path, '\n')
data = CSV.File(path)

trans_terrain = Matrix{Char}(undef, 323, 31)

for xi = 1:323
    trans_terrain[xi, begin:end] = [ding for ding in terrain[xi]]

end
terrain[end]
trans_terrain

index = 1
trees = 10
reset = 0
for riga in [x for x in 1:323 if isodd(x)]
    global index; global trees; global reset
    riga == 1 ? (index, trees, reset) =  (1,0,0) : nothing
    # println(trans_terrain[riga,begin:end])
    if trans_terrain[riga, index] == '#'
        trees+=1
        ping = trans_terrain[riga,begin:end]
        ping[index] = 'X'
        # println("$(ping) - $riga - $index")
    else
        dong = trans_terrain[riga,begin:end]
        dong[index] = 'O'
        # println(dong)
    end
    index+=1
    if index > 31
        index-= 31
        reset+=1
    end
    # riga+=1
end
# println(trans_terrain[1:10,begin:end])
trees

145
88
71
90
42
prod([145, 88, 71, 90, 42])

[x for x in 1:323 if isodd(x)]




# Day 4 Puzzle Solution ---------------------------------------------------------------------------

using DelimitedFiles
using CSV, DataFrames

path = input_path*"input_day4.txt"
path = input_path*"input_day4_V1.txt"


input = readdlm(path)
mydata = read(path, String)

inputData = split(mydata, "\n\n")
cleanData = [split(x, ['\n', ' ']) for x in inputData if length(split(x, ['\n', ' '])) >= 7] # if length(split(x, ['\n', ' '])) >= 7
ready = []

for index in 1:length(cleanData)
    push!(ready, sort!(collect(Iterators.flatten([split(x, ':') for x in cleanData[index]]))[1:2:end]) )
end
ready
count = 0
req_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]

for index in 1:length(ready)
    for item in req_fields
        if item ∉ ready[index]
            break
        end
        if item == "cid"
            count+=1
        end
    end
end

function split_and_join(lines)
  out = String[]
  tmp = String[]
  for line in lines
    if !isempty(line)
      push!(tmp, line)
    else
      push!(out, join(tmp, " "))
      empty!(tmp)
    end
  end
  return out
end

function readinput(filename)
  return [
    Dict(
      Pair(match.captures...)
      for match in eachmatch(r"([^: ]+):([^ ]+)", entry)
    )
    for entry in split_and_join(readlines(filename))
  ]
end

function isvalid1(passport)
  required = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])
  return all(field in keys(passport) for field in required)
end

inputData = readinput(path)
# inputData = ["asdsa", "afasdsad", "adasdas"]
function part1(passports)
  return count(isvalid1, passports)
end
count = 0
counto = 0
for x in inputData
    if isvalid1(x) == true
        count+=1
    else
        counto +=1
    end
end
count
counto

isvalid1(inputData[1])

req_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
req_fields in cleanData[1]

req_fields = Set(["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"])


[split(x, " ") for x in input if length(split(x," ")) >= 7]

[1,2,3,4,5,6,7,8,9,10][1:2:6]
