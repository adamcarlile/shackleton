require "spec_helper"

RSpec.describe Shackleton::Builder do

  let(:line) do 
    Shackleton::Route.new(name: :line, path: 'line(/:id)') do
      route :status
    end
  end
  let(:params)  { { id: 10 } }

  subject { Shackleton::Builder.new }

  before { subject.add_route(line, **params) }

  it { expect(subject.stack.length).to eql 1 }
  it { expect(subject.build).to eql "line/#{params[:id]}" }
  
  it { expect(subject.status.stack.length).to eql 2 }
  it { expect(subject.status.build).to eql "line/#{params[:id]}/status" }

end