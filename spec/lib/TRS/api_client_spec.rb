require 'rails_helper'

RSpec.describe TRS::APIClient do
  let(:client) { described_class.new }
  let(:trn) { '1234567' }
  let(:date_of_birth) { '1990-01-01' }

  describe '#find_teacher' do
    context 'when the API request is successful' do
      let(:response_body) { { 'firstName' => 'John', 'trn' => trn }.to_json }
      let(:response) { instance_double(Faraday::Response, success?: true, body: response_body) }

      before do
        allow(client.instance_variable_get(:@connection)).to receive(:get).and_return(response)
      end

      it 'returns a TRS::Teacher object' do
        teacher = client.find_teacher(trn:, date_of_birth:)
        expect(teacher).to be_a(TRS::Teacher)
        expect(teacher.present).to eq(
          {
            alerts: nil,
            allow_id_sign_in_with_prohibitions: nil,
            date_of_birth: nil,
            email_address: nil,
            eyts_awarded: nil,
            eyts_certificate_url: nil,
            eyts_status_description: nil,
            first_name: "John",
            higher_education_qualifications: nil,
            induction_certificate_url: nil,
            induction_end_date: nil,
            induction_start_date: nil,
            induction_status: nil,
            induction_status_description: nil,
            initial_teacher_training: nil,
            last_name: nil,
            mandatory_qualifications: nil,
            middle_name: nil,
            national_insurance_number: nil,
            npq_qualifications: nil,
            pending_date_of_birth_change: nil,
            pending_name_change: nil,
            previous_names: nil,
            qts_awarded: nil,
            qts_certificate_url: nil,
            qts_status_description: nil,
            trn: "1234567",
          }
        )
      end
    end

    context 'when the API request fails with 404' do
      let(:response) { instance_double(Faraday::Response, success?: false, status: 404, body: 'Not Found') }

      before do
        allow(client.instance_variable_get(:@connection)).to receive(:get).and_return(response)
      end

      it 'returns nil' do
        teacher = client.find_teacher(trn:, date_of_birth:)
        expect(teacher).to be_nil
      end
    end

    context 'when the API request fails with other errors' do
      let(:response) { instance_double(Faraday::Response, success?: false, status: 500, body: 'Internal Server Error') }

      before do
        allow(client.instance_variable_get(:@connection)).to receive(:get).and_return(response)
      end

      it 'raises an error' do
        expect { client.find_teacher(trn:, date_of_birth:) }.to raise_error("API request failed: 500 Internal Server Error")
      end
    end
  end
end
