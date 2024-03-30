class SanitizeController < ApplicationController

    def testPundit1
        invoice1 = SensitiveModel1.find params[:invoice_id]
        return JSON.stringify(invoice1)
    end

    def testPundit2
        invoice2 = SensitiveModel1.all params[:invoice_id]
        return JSON.stringify(invoice2)
    end

    def testPundit3
        invoice3 = SensitiveModel2.last params[:invoice_id]
        return JSON.stringify(invoice3)
    end

    def testPundit4
        invoice4 = SensitiveModel1.find params[:invoice_id]
        return JSON.stringify(invoice4)
    end

    def ok1
        invoice = SensitiveModel4.find params[:invoice_id]
        puts 'Code here is ok but what if invoice is used?'
        authorize invoice
        return JSON.stringify(invoice)
    end

    def ok2
        invoice = SensitiveModel1.find params[:invoice_id]
        authorize invoice
        return JSON.stringify(invoice)
    end

    def ok3
        invoice = SensitiveModel1.all params[:invoice_id]
        puts 'more code'
        authorize invoice
        return JSON.stringify(invoice)
    end

    def ok4
        invoice = SensitiveModel2.last params[:invoice_id]
        puts 'somethine else'
        authorize invoice
        return JSON.stringify(invoice)
    end
  
  end
