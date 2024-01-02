=begin
P
  - input: int
  - output: array of switches left on
  - rules:
      - 1st round: all lights on
      - 2nd round: toggle multiples of 2
      - 3rd round: toggle multiples of 3
      - repeat for `int` rounds
E
D
  - starting: int
  - intermediate: hash
  - ending: array
A
  - create a hash called `lights` where the keys are 1..int and the values are all 'ON'
      - create local variable `current_key` assigned to `1`
      - int times...
          - add element `current_key`: 'ON'
          - increment `current_key`
  - create a local variable called `multiplier` assigned to `2`
  - until multiplier > input int, for each key...
      - if key % multiplier == 0, toggle value
      - increment `multiplier`
  - select keys where value is `ON`
  - return array of those keys
  - toggle
      - if 'ON', reassign to 'OFF'
      - else, reassign to 'ON'
C
=end

def lights(n)
  lights = generate_lights(n)
  multiplier = 2
  until multiplier > n
    lights.each_key do |k|
      lights[k] = toggle(lights[k]) if k % multiplier == 0
    end
    multiplier += 1
  end
  lights.select { |_, v| v == 'ON' }.keys
  # display_lights_status(lights)
end

def generate_lights(number_of_lights)
  hsh = {}
  1.upto(number_of_lights) { |num| hsh[num] = 'ON' }
  hsh
end

def toggle(status)
  case status
  when 'ON' then 'OFF'
  else 'ON'
  end
end

def display_lights_status(lights)
  lights_on = lights.select { |_, v| v == 'ON' }.keys
  lights_off = lights.select { |_, v| v == 'OFF' }.keys
  puts "Lights #{joinand(lights_off)} are now off; #{joinand(lights_on)}  are on."
end

def joinand(arr, delimiter=', ', word='and')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{word} ")
  else
    arr[0..-2].join(delimiter) + ", #{word} #{arr.last}"
  end
end

p lights(5) == [1, 4]
p lights(10) == [1, 4, 9]
p lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
