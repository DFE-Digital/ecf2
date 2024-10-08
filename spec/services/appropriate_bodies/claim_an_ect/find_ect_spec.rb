RSpec.describe AppropriateBodies::ClaimAnECT::FindECT do
  describe "#initialize" do
    let(:appropriate_body) { FactoryBot.build(:appropriate_body) }
    let(:pending_induction_submission) { FactoryBot.create(:pending_induction_submission) }

    it "assigns the provided appropriate body and pending induction submission params" do
      find_ect = AppropriateBodies::ClaimAnECT::FindECT.new(appropriate_body:, pending_induction_submission:)

      expect(find_ect.appropriate_body).to eql(appropriate_body)
      expect(find_ect.pending_induction_submission).to eql(pending_induction_submission)
    end
  end

  describe "#import_from_trs" do
    context "when there is a match" do
      it "makes a call to the TRS API client with the expected parameters"
      it "assigns the incoming attributes to the pending_induction_submission and returns it"
    end

    context "when there is no match" do
      it "adds an error to the pending_induction_submission base"
    end
  end
end
