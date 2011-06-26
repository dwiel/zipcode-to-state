# -*- coding: utf-8 -*-
# Data From: http://en.wikipedia.org/wiki/File:ZIP_Code_zones.svg

class Zipcode
  @@data = {
    '0' => {
      ['10','27'] => "MA",
      ['28','29'] => "RI",
      ['30','38'] => "NH",
      ['39','49'] => "ME",
      '5' =>         "VT",
      '6' =>         "CT",
      ['7','8'] =>   "NJ",
      '9'   =>       "AE",
    }, '1' => {
      ['0','4'] =>   "NY",
      ['50','96'] => "PA",
      ['97','99'] => "DE",
    }, '2' => {
      '00' =>        "DC",
      '01' =>        "VA",
      ['02','05'] => "Fed Gov",
      ['06','19'] => "MD",
      ['20','46'] => "VA",
      ['47','69'] => "WV",
      ['7','8'] =>   "NC",
      '9' =>         "SC",
    }, '3' => {
      ['0','1'] =>   "GA",
      ['2','4'] =>   "FL",
      '40' =>        "AA",
      ['5','6'] =>   "AL",
      ['70','85'] => "TN",
      ['86','97'] => "MS",
      ['98','99'] => "GA",
    }, '4' => {
      ['0','2'] =>   "KY",
      ['3','5'] =>   "OH",
      ['6','7'] =>   "IN",
      ['8','9'] =>   "MI",
    }, '5' => {
      ['0','2'] =>   "IA",
      ['3','4'] =>   "WI",
      ['50','67'] => "MN",
      '7' =>         "SD",
      '8' =>         "ND",
      '9' =>         "MT",
    }, '6' => {
      ['0','2'] =>   "IL",
      ['3','5'] =>   "MO",
      ['6','7'] =>   "KS",
      ['8','9'] =>   "NE",
    }, '7' => {
      ['00','15'] => "LA",
      ['16','29'] => "AK",
      ['3','4'] =>   "OK",
      ['5','9'] =>   "TX",
    }, '8' => {
      ['0','1'] =>   "CO",
      ['20','31'] => "WY",
      ['32','39'] => "ID",
      '4' =>         "UT",
      ['5','6'] =>   "AZ",
      ['89','99'] => "NV",
    }, '9' => {
      ['00','61'] => "CA",
      ['62','66'] => "AP",
      ['67','68'] => "HI",
      '6799' =>      "AS",
      '7' =>         "OR",
      ['80','94'] => "WA",
      ['95','99'] => "AK",
    }
  }

  def self.zipcode_to_state(zipcode)
    zipcode = zipcode.to_str
    if zipcode.length != 5
      return nil
    end
    branch = @@data[zipcode[0..0]]
    z1 = zipcode[1..1]
    z2 = zipcode[1..2]
    branch.each { |k,v|
      if k.class == Array
        if k[0].length == 1 :
          z = z1
        elsif k[0].length == 2
          z = z2
        end
        if (k[0].to_i <= z.to_i) and (z.to_i <= k[1].to_i)
          return v
        end
      elsif (k.length == 1 and k == z1) or \
          (k.length == 2 and k == z2) :
        return v
      end
    }
    return nil
  end

  def self.test()
    puts zipcode_to_state('27717')
  end
end