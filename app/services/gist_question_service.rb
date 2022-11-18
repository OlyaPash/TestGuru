class GistQuestionService

  Result = Struct.new(:gist_url, :success?)

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    Result.new(@client.last_response.data[:html_url], @client.last_response.status == 201)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
