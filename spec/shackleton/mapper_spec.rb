require "spec_helper"

RSpec.describe Shackleton::Mapper do

  subject do 
    Shackleton::Mapper.new do
      route :line, 'line(/:id)' do
        route :status
      end
    end
  end
  let(:id) { 10 }

  it { expect(subject.line(id: id)).to be_instance_of Shackleton::Builder }
  it { expect(subject.line(id: id).status).to be_instance_of Shackleton::Builder }
  
  it { expect(subject.line(id: id).status.to_s).to eql("line/#{id}/status") }

  it { expect(subject.line(id: id, another_param: 123).status.to_s).to eql("line/#{id}/status?another_param=123") }

end