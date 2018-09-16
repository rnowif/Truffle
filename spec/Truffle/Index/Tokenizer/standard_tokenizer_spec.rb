require 'Truffle/Index/Tokenizer/standard_tokenizer'

RSpec.describe 'Standard Tokenizer' do
  tokenizer = StandardTokenizer.new
  it 'should cut on whitespaces' do
    tokens = tokenizer.tokenize('hello world')
    expect(tokens).to contain_exactly('hello', 'world')
  end

  it 'should keep only alphanumerical chars' do
    tokens = tokenizer.tokenize('hello, world!')
    expect(tokens).to contain_exactly('hello', 'world')
  end

  it 'should split compounded words into two tokens' do
    tokens = tokenizer.tokenize('award-winning')
    expect(tokens).to contain_exactly('award', 'winning')
  end

  it 'should lowercase tokens' do
    tokens = tokenizer.tokenize('Hello World!')
    expect(tokens).to contain_exactly('hello', 'world')
  end
end
