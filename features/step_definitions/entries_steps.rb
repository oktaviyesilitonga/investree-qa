When('user able to get all entries') do
  response = ApiBaseHelper.execute('get', 'entries')
  expect(response.code.to_i).to eql 200
  @get_all_entries = response.body
end

Then('user should able to get all entries successfully') do
  aggregate_failures('Verify get all entries API response') do
    expect(@get_all_entries['count']).to eql 1425
    expect(@get_all_entries['entries'][0]['API']).to eql 'AdoptAPet'
    expect(@get_all_entries['entries'][0]['Auth']).to eql 'apiKey'
    expect(@get_all_entries['entries'][0]['HTTPS']).to eql true
    expect(@get_all_entries['entries'][0]['Cors']).to eql 'yes'
    expect(@get_all_entries['entries'][0]['Category']).to eql 'Animals'
    expect(@get_all_entries['entries'][1]['API']).to eql 'Axolotl'
    expect(@get_all_entries['entries'][1]['Auth']).to eql ''
    expect(@get_all_entries['entries'][1]['HTTPS']).to eql true
    expect(@get_all_entries['entries'][1]['Cors']).to eql 'no'
    expect(@get_all_entries['entries'][1]['Category']).to eql 'Animals'
  end
end

When('user able to {string} filter entries by {string}') do |method, path|
  response = ApiBaseHelper.execute(method, path)
  expect(response.code.to_i).to eql 200
  @get_by_filter = response.body
end

Then('user should able to filter entries by {string} and {string}') do |data, param|
  aggregate_failures('Verify filter entries by title API response') do

    if data == 'tile'
      expect(@get_by_filter['entries'][0]['API']).to eql param

    elsif data == 'description'
      expect(@get_by_filter['entries'][0]['Description']).to eql param

    elsif data == 'auth'
      expect(@get_by_filter['entries'][0]['Auth']).to eql param

    elsif data == 'https true'
      expect(@get_by_filter['entries'][0]['HTTPS']).to eql true

    elsif data == 'https false'
      expect(@get_by_filter['entries'][0]['HTTPS']).to eql false

    elsif data == 'cors'
      expect(@get_by_filter['entries'][0]['Cors']).to eql param

    elsif data == 'category'
      expect(@get_by_filter['entries'][0]['Category']).to eql param
    end
  end
end
