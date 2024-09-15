module AppropriateBodies
  module ClaimAnECT
    class CheckECTController < AppropriateBodiesController
      def edit
        # FIXME: find within the scope of the current AB

        @pending_induction_submission = PendingInductionSubmission.find(params[:id])
      end

      def update
        @pending_induction_submission = AppropriateBodies::ClaimAnECT::CheckECT
          .new(appropriate_body: @appropriate_body, pending_induction_submission_id: params[:id])
          .confirm_info_correct(confirmed?)

        if @pending_induction_submission.save
          # FIXME: redirect somewhere more sensible than this

          redirect_to(root_url)
        else
          render :edit
        end
      end

    private

      def confirmed?
        confirmed_param = params.require("pending_induction_submission").fetch("confirmed")

        ActiveModel::Type::Boolean.new.cast(confirmed_param)
      end
    end
  end
end
