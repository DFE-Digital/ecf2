module AppropriateBodies
  module Teachers
    class ReleaseECTController < AppropriateBodiesController
      def new
        @teacher = Teacher.find(params[:ab_teacher_id])

        @pending_induction_submission = PendingInductionSubmission.new
      end

      def create
        @teacher = Teacher.find(params[:ab_teacher_id])
        @pending_induction_submission = PendingInductionSubmission.new(
          **pending_induction_submission_params,
          **pending_induction_submission_attributes
        )

        release_ect = AppropriateBodies::ReleaseECT.new(appropriate_body: @appropriate_body, pending_induction_submission: @pending_induction_submission)

        PendingInductionSubmission.transaction do
          if @pending_induction_submission.save(context: :release_ect) && release_ect.release!
            redirect_to ab_teacher_release_ect_path(@teacher)
          else
            render :new
          end
        end
      end

      def show
        @teacher = Teacher.find(params[:ab_teacher_id])
      end

    private

      def pending_induction_submission_params
        params.require(:pending_induction_submission).permit(:finished_on, :number_of_terms)
      end

      def pending_induction_submission_attributes
        { appropriate_body_id: @appropriate_body.id, trn: @teacher.trn }
      end
    end
  end
end
