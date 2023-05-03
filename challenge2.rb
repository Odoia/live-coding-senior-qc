class Subject
    attr_accessor :val, :next_subject
  
    def initialize(val, next_subject)
      @val = val
      @next_subject = next_subject
    end
  
    def to_s
      "Subject.new(#{val}, #{next_subject || 'nil'})"
    end
  end
  
  # Implemente a função reverse_subjects_list que recebe um nó de uma lista encadeada
  # e retorna o nó da cabeça da lista encadeada invertida.
  def reverse_subjects_list(subject)
    # Implemente aqui sua solução
  end
  
  head = Subject.new(1, Subject.new(2, Subject.new(3, nil)))
  result = reverse_subjects_list(head)
  puts(result)
  # Output esperado: Subject.new(3, Subject.new(2, Subject.new(1, nil)))