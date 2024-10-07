class Migration::FailuresController < ::AdminController
  layout "migration"

  def index
    @migration_failures = MigrationFailure.where(data_migration_id: DataMigration.where(model: params[:model]).select(:id))
    @model = params[:model]
  end
end
