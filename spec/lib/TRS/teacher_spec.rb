require 'rails_helper'

RSpec.describe TRS::Teacher do
  let(:data) do
    {
      'trn' => '1234567',
      'firstName' => 'John',
      'middleName' => 'A.',
      'lastName' => 'Doe',
      'dateOfBirth' => '1980-01-01',
      'nationalInsuranceNumber' => 'AB123456C',
      'emailAddress' => 'john.doe@example.com',
      'eyts' => { 'awarded' => '2024-09-18', 'certificateUrl' => 'eyts_certificate_url', 'statusDescription' => 'eyts_status' },
      'alerts' => [
        {
          'alertId' => '3fa85f64-5717-4562-b3fc-2c963f66afa6',
          'alertType' => {
            'alertTypeId' => '3fa85f64-5717-4562-b3fc-2c963f66afa6',
            'alertCategory' => {
              'alertCategoryId' => '3fa85f64-5717-4562-b3fc-2c963f66afa6',
              'name' => 'Category Name'
            },
            'name' => 'Type Name'
          },
          'startDate' => '2024-09-18',
          'endDate' => '2024-09-18'
        }
      ],
      'induction' => {
        'startDate' => '2024-09-18',
        'endDate' => '2024-09-18',
        'status' => 'Exempt',
        'statusDescription' => 'Induction Status Description',
        'certificateUrl' => 'induction_certificate_url'
      },
      'pendingNameChange' => true,
      'pendingDateOfBirthChange' => true,
      'qts' => { 'awarded' => '2024-09-18', 'certificateUrl' => 'qts_certificate_url', 'statusDescription' => 'qts_status' },
      'initialTeacherTraining' => [
        {
          'qualification' => { 'name' => 'Qualification Name' },
          'ageRange' => { 'description' => 'Age Range Description' },
          'provider' => { 'name' => 'Provider Name', 'ukprn' => 'Provider UKPRN' },
          'subjects' => [{ 'code' => 'Subject Code', 'name' => 'Subject Name' }],
          'startDate' => '2024-09-18',
          'endDate' => '2024-09-18',
          'programmeType' => 'Apprenticeship',
          'programmeTypeDescription' => 'Programme Type Description',
          'result' => 'Pass'
        }
      ],
      'npqQualifications' => [
        {
          'type' => { 'code' => 'NPQEL', 'name' => 'NPQEL Name' },
          'awarded' => '2024-09-18',
          'certificateUrl' => 'npq_certificate_url'
        }
      ],
      'mandatoryQualifications' => [
        {
          'awarded' => '2024-09-18',
          'specialism' => 'Specialism'
        }
      ],
      'higherEducationQualifications' => [
        {
          'subjects' => [{ 'code' => 'HE Subject Code', 'name' => 'HE Subject Name' }],
          'name' => 'HE Qualification Name',
          'awarded' => '2024-09-18'
        }
      ],
      'previousNames' => [
        {
          'firstName' => 'Previous First Name',
          'middleName' => 'Previous Middle Name',
          'lastName' => 'Previous Last Name'
        }
      ],
      'allowIdSignInWithProhibitions' => true
    }
  end

  subject { described_class.new(data) }

  describe '#present' do
    it 'returns a hash with flattened attributes' do
      expected_hash = {
        trn: '1234567',
        first_name: 'John',
        middle_name: 'A.',
        last_name: 'Doe',
        date_of_birth: '1980-01-01',
        national_insurance_number: 'AB123456C',
        email_address: 'john.doe@example.com',
        eyts_awarded: '2024-09-18',
        eyts_certificate_url: 'eyts_certificate_url',
        eyts_status_description: 'eyts_status',
        alerts: data['alerts'],
        induction_start_date: '2024-09-18',
        induction_end_date: '2024-09-18',
        induction_status: 'Exempt',
        induction_status_description: 'Induction Status Description',
        induction_certificate_url: 'induction_certificate_url',
        pending_name_change: true,
        pending_date_of_birth_change: true,
        qts_awarded: '2024-09-18',
        qts_certificate_url: 'qts_certificate_url',
        qts_status_description: 'qts_status',
        initial_teacher_training: data['initialTeacherTraining'],
        npq_qualifications: data['npqQualifications'],
        mandatory_qualifications: data['mandatoryQualifications'],
        higher_education_qualifications: data['higherEducationQualifications'],
        previous_names: data['previousNames'],
        allow_id_sign_in_with_prohibitions: true
      }

      expect(subject.present).to eq(expected_hash)
    end
  end
end
