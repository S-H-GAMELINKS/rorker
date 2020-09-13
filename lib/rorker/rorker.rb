class Rorker
    def initialize task, worker_count: 10
      @task = task
      @pipe = create_pipe
      @workers = create_workers worker_count 
    end

    def send(arg)
        @pipe.send arg
    end

    def run
      yield Ractor.select *@workers
    end

    def create_pipe
        Ractor.new do
            loop do
                Ractor.yield Ractor.recv
            end
        end
    end

    def create_workers worker_count 
        (1..worker_count).map do |number|
            Ractor.new @pipe, @task, name: "worker_#{number}"  do |pipe, task|
                loop do 
                  arg = pipe.take
                  task.send arg
                  Ractor.yield task.take
                end
            end
        end
    end
end
