# frozen_string_literal: true

module Docuseal
  class Api
    Error = Class.new(StandardError)

    private attr_reader :http

    def initialize(config)
      @http = Http.new(config)
    end

    def list_templates(params = {})
      http.get('/templates', params)
    end

    def get_template(id, params = {})
      http.get("/templates/#{id}", params)
    end

    def create_template_from_docx(data)
      http.post('/templates/docx', data)
    end

    def create_template_from_html(data)
      http.post('/templates/html', data)
    end

    def create_template_from_pdf(data)
      http.post('/templates/pdf', data)
    end

    def merge_templates(data)
      http.post('/templates/merge', data)
    end

    def clone_template(id, data)
      http.post("/templates/#{id}/clone", data)
    end

    def update_template(id, data)
      http.put("/templates/#{id}", data)
    end

    def update_template_documents(id, data)
      http.put("/templates/#{id}/documents", data)
    end

    def archive_template(id)
      http.delete("/templates/#{id}")
    end

    def permanently_delete_template(id)
      http.delete("/templates/#{id}", { permanently: true })
    end

    def list_submissions(params = {})
      http.get('/submissions', params)
    end

    def get_submission(id, params = {})
      http.get("/submissions/#{id}", params)
    end

    def get_submission_documents(id, params = {})
      http.get("/submissions/#{id}/documents", params)
    end

    def create_submission(data)
      http.post('/submissions/init', data)
    end

    def create_submission_from_emails(data)
      http.post('/submissions/emails', data)
    end

    def archive_submission(id)
      http.delete("/submissions/#{id}")
    end

    def permanently_delete_submission(id)
      http.delete("/submissions/#{id}", { permanently: true })
    end

    def list_submitters(params = {})
      http.get('/submitters', params)
    end

    def get_submitter(id, params = {})
      http.get("/submitters/#{id}", params)
    end

    def update_submitter(id, data)
      http.put("/submitters/#{id}", data)
    end
  end
end
