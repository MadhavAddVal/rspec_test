class SampleController
  def initialize(service)
    @service = service
  end

  def show
    result = @service.perform_action
    if result.success?
      render_success(result.data)
    else
      render_error(result.error)
    end
  end

  private

  def render_success(data)
    { status: 200, body: data.to_json }
  end

  def render_error(error)
    { status: 400, body: { error: error }.to_json }
  end
end
