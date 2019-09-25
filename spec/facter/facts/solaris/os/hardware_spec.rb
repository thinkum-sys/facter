# frozen_string_literal: true

describe 'Solaris OsHardware' do
  context '#call_the_resolver' do
    it 'returns a fact' do
      expected_fact = double(Facter::ResolvedFact, name: 'os.hardware', value: 'i86pc')
      allow(Facter::Resolvers::Uname).to receive(:resolve).with(:machine).and_return('i86pc')
      allow(Facter::ResolvedFact).to receive(:new).with('os.hardware', 'i86pc').and_return(expected_fact)

      fact = Facter::Solaris::OsHardware.new
      expect(fact.call_the_resolver).to eq(expected_fact)
    end
  end
end
