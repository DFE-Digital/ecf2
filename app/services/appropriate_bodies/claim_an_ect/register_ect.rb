module AppropriateBodies
  module ClaimAnECT
    class RegisterECT
      attr_reader :appropriate_body, :pending_induction_submission

      def initialize(appropriate_body:, pending_induction_submission:)
        @appropriate_body = appropriate_body
        @pending_induction_submission = pending_induction_submission
      end

      def register(pending_induction_submission_params)
        pending_induction_submission.assign_attributes(**pending_induction_submission_params)

        # within a transaction:
        #
        # TODO: persist this submission as related Teacher and InductionPeriod
        #       records
        # TODO: create a job that will submit the relevant information to
        #       the TRS API

        pending_induction_submission
      end
    end
  end
end
